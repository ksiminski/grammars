
#ifndef AST_H
#define AST_H

#include <string>
#include <vector>
#include <sstream>

///////////////////////
// klasy abstrakcyjnego drzewa składniowego

// wzorzec projektowy interpreter 
class Symbol 
{
   public:
      virtual std::string emit() = 0;
      std::vector<Symbol *> symbols;

      virtual ~Symbol() 
      {
         for (auto &p : symbols)
         {
            delete p;
         }
         symbols.clear();
      }
};

class Terminal : public Symbol
{
};

class Nonterminal : public Symbol
{
};

class ForLoopSymbol : public Nonterminal
{
   public:
      std::string emit() override 
      {
         std::stringstream sos;
         sos << "{" << std::endl;
         sos << "   " << symbols[0]->emit() << ';' << std::endl;
         sos << "   while ( " << symbols[1]->emit() << ") then" << std::endl;
         sos << "   {" << std::endl;
         sos << symbols[3]->emit() << std::endl; 
         sos << symbols[2]->emit() << ';' << std::endl; 
         sos << "   }" << std::endl;
         sos << "}" << std::endl;
         return sos.str();
      }
};

class AssignmentSymbol : public Nonterminal
{
   public:
      std::string emit() override
      {
         std::stringstream sos;
         sos << symbols[0]->emit() << " := " << symbols[1]->emit();  
         return sos.str();
      }
};

class DefSymbol : public Nonterminal
{
   public:
      std::string emit() override
      {
         std::stringstream sos;
         sos << symbols[0]->emit() << " " << symbols[1]->emit();
         return sos.str();
      }
};

class IntSymbol : public Terminal
{
   public: 
      std::string emit() override
      {
         return "integer";
      }
};

class NumberSymbol : public Terminal
{
   public:
      int value; 
      std::string emit() override
      {
         return std::to_string(value);
      }
};

class IdSymbol : public Terminal
{
   public:
      std::string value; 
      std::string emit() override
      {
         return value;
      }
};

class ExpressionSymbol : public Nonterminal 
{
   std::string emit() override
   {
      return symbols[0]->emit();
   }
};

class OperatorSymbol : public Nonterminal
{
   public:
      std::string value; 
      std::string emit() override
      {
         return value;
      }
};

class BlockSymbol : public Nonterminal
{
   public:
      std::string emit() override
      {
         std::stringstream sos;
         sos << "{" << std::endl;
         for (auto &p : symbols)
         {
            sos << p->emit();
         }
         sos << "}" << std::endl;
         return sos.str();
      }
};

class StatementsSymbol : public Nonterminal
{
   public:
      std::string emit() override
      {
         std::stringstream sos;
         for (auto &p : symbols)
         {
            sos << p->emit();
         }
         return sos.str();
      }
};

class StatementSymbol : public Nonterminal
{
   public:
      std::string emit() override
      {
         std::stringstream sos;
         for (auto &p : symbols)
         {
            sos << p->emit();
         }
         sos << ";"; 
         return sos.str();
      }
};

class IncrementationSymbol : public Nonterminal
{
   public:
      std::string emit() override
      {
         std::stringstream sos;
         sos << "++" << symbols[0]->emit();
         return sos.str();
      }
};

class ConditionSymbol : public Nonterminal
{
   public:
      std::string emit() override
      {
         std::stringstream sos;
         sos << symbols[0]->emit() << " " << symbols[1]->emit() << " " << symbols[2]->emit();
         return sos.str();
      }
};

///////////////////////

#endif

